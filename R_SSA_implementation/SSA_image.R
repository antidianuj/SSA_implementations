# Artificial image for 2dSSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
  rnorm(50^2, sd = 0.1)
# Decompose 'mx' with circular window
s <- ssa(mx, kind = "2d-ssa", column.projector = "centering", row.projector = "centering", neig = 25)
# Reconstruct
r <- reconstruct(s, groups = list(1, 2:5))
# Plot components, original image and residuals
plot(r)
write.csv(r$F3,"C:/Users/dianu/Desktop/Brain Network Research/SSA/R_SSA_implementation/ref.csv")
library('plot.matrix')
plot(mx,col=grey(seq(0, 1, length = 256)))
plot(r$F1,col=grey(seq(0, 1, length = 256)))
plot(r$F3,col=grey(seq(0, 1, length = 256)))
plot(r$F4,col=grey(seq(0, 1, length = 256)))
