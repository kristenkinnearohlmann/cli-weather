describe Weather do
    context 'Initialize application' do
        it 'Greets the user' do
            Weather.start.should eq("Let's get the weather!")
        end
    end
end