module Settings

export c, p, rationalTimeSteps, irrationalTimeSteps, numNegEigenvalues, numPosEigenvalues, initFunc, initFunc2

c = 9
p = pi
rationalTimeSteps = [0, pi, pi / 2, pi / 3, pi / 4, pi / 5, pi / 6, pi / 7, pi / 8, pi / 9, pi / 10, 2 * pi / 15, pi / 15, pi / 30]
irrationalTimeSteps = [0.0001, 0.001, 0.01, 0.1, 0.2, 0.3, 0.4, 0.5]

numNegEigenvalues = 1000
negEigenList = [0.5, 1., 2., 2.5, 3.3, 3.5]
for i in 5:(numNegEigenvalues / 2 + 1)
    lower = i - (i - sqrt(i^2 - c)) * (1 - p / (2 * pi)) - 0.1
    upper = i - (i - sqrt(i^2 - c)) * (1 - p / (2 * pi)) + 0.1
    append!(negEigenList, [lower, upper])
end

numPosEigenvalues = 3
posEigenList = [1.7, 2.5, 2.9]

function initFunc(x)
    if x <= pi/2
        return 0
    else
        return 1
    end
end

initFunc2(x) = 1 - (1 + exp(-2 * 100 * x))^(-1) + (1 + exp(-2 * 100 * (x - pi)))^(-1) - (1 + exp(-2 * 100 * (x- 2 * pi)))^(-1)

end