module Settings

export c, p, rationalTimeSteps, irrationalTimeSteps, numNegEigenvalues, numPosEigenvalues, initFunc, initFunc2

c = 9
p = pi / 2
rationalTimeSteps = [0, pi, pi / 2, pi / 3, pi / 4, pi / 5, pi / 6, pi / 7, pi / 8, pi / 9, pi / 10, 2 * pi / 15, pi / 15, pi / 30]
irrationalTimeSteps = [0.0001, 0.001, 0.01, 0.1, 0.2, 0.3, 0.4, 0.5]

numNegEigenvalues = 1000
negEigenList = [1.59, 1.76, 3.02, 3.16]
for i in 5:(numNegEigenvalues / 2 + 2)
    lower = i - (i - sqrt(i^2 - c)) * (1 - p / (2 * pi)) - 0.1
    higher = i - (i - sqrt(i^2 - c)) * (1 - p / (2 * pi)) + 0.1
    append!(negEigenList, [lower, higher])
end

numPosEigenvalues = 5
posEigenList = [1.1, 1.9, 2.45, 2.76, 2.94]

function initFunc(x)
    jump = pi
    if x <= jump - 2 * pi
        return 0
    elseif x <= 0
        return 1
    elseif x <= jump
        return 0
    else
        return 1
    end
end

initFunc2(x) = 1 - (1 + exp(-2 * 100 * x))^(-1) + (1 + exp(-2 * 100 * (x - pi)))^(-1) - (1 + exp(-2 * 100 * (x- 2 * pi)))^(-1)

end