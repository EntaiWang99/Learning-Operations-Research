function [x,z] = Part_I_BFS_North_corner(c,d,s)
    [m,n] = size(c);
    c0 = c;
    x = zeros(m,n);
    %%the initial xij(same as the size of c)

    %%Northwest corner method to determine initial bfs
    i = 1;j = 1;%%(1,1)start
    while i<=m && j<=n
        x(i,j) = min(s(i),d(j));
        %%you should do follow things before transfer into next line
        s(i) = s(i) - x(i,j);
        d(j) = d(j) - x(i,j);
        if s(i)>=d(j)
            j = j + 1;
        else
            i = i + 1;
        end
    end
    z = dot(c0,x);
    sum(z);