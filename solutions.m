
for m=1:100


grid=sparse(grid);

grid(1,:)=0;
grid(n,:)=0;
grid(:,1)=0;
grid(:,n)=0;
sum=zeros(n,n);
new = zeros(n,n);


for i=2:n-1
  for j=2:n-1
    sum(i,j)= grid(i-1,j-1)+grid(i,j-1)+grid(i,j+1)+grid(i-1,j)+grid(i-1,j+1)+grid(i+1,j-1)+grid(i+1,j)+grid(i+1,j+1);
  end
end

for i=2:n-1
  for j=2:n-1
    if grid(i,j)==1
      if (sum(i,j)==2 | sum(i,j)==3)
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


 pcolor(grid)
 colormap gray
drawnow
pause(0.001)
end
