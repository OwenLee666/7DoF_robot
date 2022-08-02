function Variable = adjust_variable(Variable)

for i = 2:7
    if Variable(i) > 180
        while Variable(i) > 180, Variable(i) = Variable(i) - 360; end
    elseif Variable(i) < -180
        while Variable(i) < -180, Variable(i) = Variable(i) + 360; end
    end
end

end

