describe Weather do
    context 'Initialize application' do
        it 'Greets the user' do
            # #puts always includes a newline character that needs to be tested for
            expect { Weather.new }.to output("Let's get the weather!\n").to_stdout
        end
    end
end