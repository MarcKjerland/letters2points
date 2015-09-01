% Generate 2d points based on some letters
% so i can plot a word in monospace

num_letters = 6;
width = 1;

centers = ( [0:num_letters-1] .+ 0.5 ) * width*1.5;

% dots per width
dpw = 10;

function pts = big_L(cx, w, dpw)
    % L
    w2 = w / 2.0;
    Xvertbar = (cx-w2) * ones(1,dpw*2);
    Yvertbar = linspace(0, 2*w, dpw*2);
    Xhorizbar = linspace(cx-w2, cx+w2, dpw);
    Yhorizbar = 0 * ones(1,dpw);
    pts = [ Xvertbar, Xhorizbar ; Yvertbar, Yhorizbar ];
    return
end

function pts = small_o(cx, w, dpw)
    % o
    r = w / 2.0; % radius
    dpsc = dpw * pi/2; % dots per semi-circle
    Xover = r*cos(linspace(0,pi,dpsc)) + cx;
    Yover = r*sin(linspace(0,pi,dpsc)) + r;
    Xunder = r*cos(linspace(pi,2*pi,dpsc)) + cx;
    Yunder = r*sin(linspace(pi,2*pi,dpsc)) + r;
    pts = [ Xover, Xunder ; Yover, Yunder ];
    return
end

function pts = small_r(cx, w, dpw)
    % r
    w2 = w / 2.0;
    Xvertbar = (cx-w2) * ones(1,dpw);
    Yvertbar = linspace(0, w, dpw);
    Xhorizbar = linspace(cx-w2, cx+w2, dpw);
    Yhorizbar = w * ones(1,dpw);
    pts = [ Xvertbar, Xhorizbar ; Yvertbar, Yhorizbar ];
    return
end

function pts = small_e(cx, w, dpw)
    % r
    w2 = w / 2.0;
    Xvertbar = (cx-w2) * ones(1,dpw);
    Yvertbar = linspace(0, w, dpw);
    Xhorizbar = linspace(cx-w2, cx+w2, dpw);
    Yhorizbar1 = 0 * ones(1,dpw);
    Yhorizbar2 = w / 2.0 * ones(1,dpw);
    Yhorizbar3 = w * ones(1,dpw);
    pts = [ Xvertbar, Xhorizbar, Xhorizbar, Xhorizbar ; Yvertbar, Yhorizbar1, Yhorizbar2, Yhorizbar3 ];
    return
end

function pts = small_n(cx, w, dpw)
    % n
    w2 = w / 2.0;
    Xvertbar1 = (cx-w2) * ones(1,dpw);
    Xvertbar2 = (cx+w2) * ones(1,dpw);
    Yvertbar = linspace(0, w, dpw);
    Xdiag = linspace(cx-w2, cx+w2, dpw*sqrt(2));
    Ydiag = linspace(w, 0, dpw*sqrt(2));
    pts = [ Xvertbar1, Xdiag, Xvertbar2 ; Yvertbar, Ydiag, Yvertbar ];
    return
end

function pts = small_z(cx, w, dpw)
    % z
    w2 = w / 2.0;
    Xhorizbar = linspace(cx-w2, cx+w2, dpw);
    Yhorizbar1 = w  * ones(1,dpw);
    Yhorizbar2 = 0 * ones(1,dpw);
    Xdiag = linspace(cx+w2, cx-w2, dpw*sqrt(2));
    Ydiag = linspace(w, 0, dpw*sqrt(2));
    pts = [ Xhorizbar, Xdiag, Xhorizbar ; Yhorizbar1, Ydiag, Yhorizbar2 ];
    return
end

L = big_L(centers(1), width, dpw);
o = small_o(centers(2), width, dpw);
r = small_r(centers(3), width, dpw);
e = small_e(centers(4), width, dpw);
n = small_n(centers(5), width, dpw);
z = small_z(centers(6), width, dpw);
letters = [L,o,r,e,n,z];

% Add some thickness to each letter
perturb_letters1 = letters .+ randn(size(letters))*sqrt(0.01/dpw);
perturb_letters2 = letters .+ randn(size(letters))*sqrt(0.01/dpw);
perturb_letters3 = letters .+ randn(size(letters))*sqrt(0.01/dpw);
letters = [letters, perturb_letters1, perturb_letters2, perturb_letters3];

X_coords = letters(1,:);
Y_coords = letters(2,:);
mycolors = rand(size(letters,2),3);
dot_size = 8;
scatter(X_coords,Y_coords,dot_size,mycolors,'filled')

save("letters.mat","X_coords","Y_coords")
