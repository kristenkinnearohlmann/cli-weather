describe Weather do
    context '#initalize' do
        it 'Greets the user' do
            # #puts always includes a newline character that needs to be tested for
            forecast = DisplayWeather.new
            expect {forecast.run}.to output("\nLet's get the weather!\n").to_stdout
        end

    end
end