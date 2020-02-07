% Name: Seth Thompson
% Student Number: 101031310

% ELEC 4700 | Harmonic Wave Equation PA

close all
clear 
clc

% Creating a sparse matrix 

nx = 50;
ny = 50;

G = sparse(nx*ny);

% populating the G matrix
for i = 1 : nx
    for j = 1 : ny
        n = j + (i - 1)*ny; % Node mapping as defined in slides.
        nxm = j + (i - 2)*ny;
        nxp = j + i*ny;
        nym = (j - 1) + (i - 1)*ny;
        nyp = (j + 1) + (i - 1)*ny;
        if (i == 1 || i == nx)
            G(n,n) = 1;
        elseif (j == 1 || j == ny)
            G(n,n) = 1;
        elseif (i > 10 && i < 20 && j > 10 && j < 20)
            G(n,n) = -2;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        else
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end
    end
end

% Looking at the sparse matrix to see the non-zero elements
figure(1)
spy(G)

% Obtaining the eigenvalues and eigenvectors
[E,D] = eigs(G,9,'SM');

% Plotting eigenvalues
figure(2)
plot(diag(D),'rx')

% Re-mapping Eigen vectors to matrix
for i = 1 : nx
    for j = 1:ny
        n = j + (i - 1)*ny;
        Mode1(i,j) = E(n,1); 
        Mode2(i,j) = E(n,2);
        Mode3(i,j) = E(n,3);   
        Mode4(i,j) = E(n,4);
        Mode5(i,j) = E(n,5);
        Mode6(i,j) = E(n,6);
        Mode7(i,j) = E(n,7);
        Mode8(i,j) = E(n,8);
        Mode9(i,j) = E(n,9);
    end
end

% Plotting all of the modes in one figure
figure (3)
subplot(3,3,1)
surf(Mode1)
subplot(3,3,2)
surf(Mode2)
subplot(3,3,3)
surf(Mode3)
subplot(3,3,4)
surf(Mode4)
subplot(3,3,5)
surf(Mode5)
subplot(3,3,6)
surf(Mode6)
subplot(3,3,7)
surf(Mode7)
subplot(3,3,8)
surf(Mode8)
subplot(3,3,9)
surf(Mode9)

