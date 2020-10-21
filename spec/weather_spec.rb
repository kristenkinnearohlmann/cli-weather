describe Weather do
    context 'Start application' do
        it 'Greets the user and asks for input' do
            # #puts always includes a newline character that needs to be tested for
            expect {Weather.new}.to output("Let's get the weather!\nEnter a location (zipcode or city, state zipcode) to find some weather: \n").to_stdout
        end

    end
end