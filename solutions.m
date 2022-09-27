% size of the game, i.e  30,50,100, etc.
n = 64;

% creates a matrix of 0's and 1's with size n
grid = round(rand(n,n));

% number of generations
for m=1:100

% convert to sparse matrix to save memory
grid=sparse(grid);

grid(1,:)=0;
grid(n,:)=0;
grid(:,1)=0;
grid(:,n)=0;
sum=zeros(n,n);
new = zeros(n,n);

% cells' neighbours
for i=2:n-1
  for j=2:n-1
    sum(i,j)= grid(i-1,j-1)+grid(i,j-1)+grid(i,j+1)+grid(i-1,j)+grid(i-1,j+1)+grid(i+1,j-1)+grid(i+1,j)+grid(i+1,j+1);
  end
end

% Game's rules
for i=2:n-1
  for j=2:n-1
    if grid(i,j)==1
      if (sum(i,j)==2 | sum(i,j)==3) % any live cells with two or three live neighbours lives on to the next generation
        new(i,j)=1;
      else
        new(i,j)=0;
      end
    else
      if sum(i,j)==3
        new(i,j)=1;
      else
        new(i,j)=0;
      end
    end
  end
end

for i=2:n-1
  for j=2:n-1
    grid(i,j)=new(i,j);
  end
end

% display matrix into colored cells
 pcolor(grid)
 colormap gray

% update figures
drawnow
pause(0.001)
end
