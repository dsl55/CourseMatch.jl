x = [1 0 1;
     1 0 1;
     1 0 1;
     1 0 1;
     0 1 1;
     1 1 1]
q = [3;3;4]
N = 3
p = [30; 0; 50]
numstud = sum(x, 1)

#Clearing Error Function
function  z(x::Matrix, q::Vector, p::Vector)
    # S is the number of students, N is the number of courses
    # x is the SxN allocation matrix
    # q is the Nx1 course capacity vector
    # p is the Nx1 price vector
    z = zeros(N)        #Create empty Nx1 vector of clearing errors
    numstud = sum(x, 1) #Create 1xN vector with the number of students enrolled in each course.
    for i in 1:N        #For every course
        if p[i] > 0     #As long as the price in this course is positive.
            z[i] = numstud[i] - q[i]
        else
            z[i] = max(numstud[i] - q[i], 0)
    end
    return z
end
end

z(x, q, p)

#Clearing error alpha
for j in 1:N
function alpha = sqrt(sum(z^2, 1))
