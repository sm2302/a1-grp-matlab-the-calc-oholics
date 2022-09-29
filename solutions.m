% Conway's Game of Life (Brute Force Method)

% size of the game, i.e  30,50,100, etc.
n = 64;

% creates a matrix of 0's and 1's with size n
grid = round(rand(n,n));

% number of generations
gen = 200;
for m = 1:gen

% convert to sparse matrix to save memory
grid = sparse(grid);

% clear borders
grid(1,:) = 0;
grid(n,:) = 0;
grid(:,1) = 0;
grid(:,n) = 0;

% create sum and new matrices
sum = zeros(n,n);
new = zeros(n,n);

% cells' neighbours
for i = 2:n-1
  for j = 2:n-1
    sum(i,j) = grid(i-1,j-1) + grid(i,j-1) + grid(i,j+1) + grid(i-1,j) + grid(i-1,j+1) + grid(i+1,j-1) + grid(i+1,j) + grid(i+1,j+1);
  end
end

% Rules of Conway's Game of Life
for i = 2:n-1
  for j = 2:n-1
    if grid(i,j) == 1
      if sum(i,j) == 2           % any live cells with two or three live neighbours lives on to the next generation
        new(i,j) = 1;
      elseif sum(i,j) == 3
        new(i,j) = 1;
      else                       % any live cells with fewer than two or more than three live neighbours dies
        new(i,j) = 0;
      end
    else
      if sum(i,j) == 3           % any dead cells with exactly three live neighbours becomes a live cell (reproduction)
        new(i,j) = 1;
      else
        new(i,j) = 0;
      end
    end
  end
end

for i = 2:n-1
  for j = 2:n-1
    grid(i,j) = new(i,j);
  end
end

% display matrix into b/w grid
 pcolor(grid)
 colormap gray

% update grid
drawnow
pause(0.001)
end
