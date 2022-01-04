RSpec.shared_examples 'checks failure status' do
  it 'should return failure status' do
    expect(response).to have_http_status(406)
  end

  it 'should have failure message' do
    json_response = JSON.parse(response.body)
    expect(json_response['message']).to eq('Failed To Create Product')
  end

  it 'should contain errors' do
    json_response = JSON.parse(response.body)
    expect(json_response['errors']).not_to be_nil
  end
end