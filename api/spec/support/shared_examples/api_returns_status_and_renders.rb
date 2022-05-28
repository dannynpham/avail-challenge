RSpec.shared_examples 'API returns status and renders' do |expected_status_code, expected_json_schema|
  it "returns #{expected_status_code.inspect}" do
    make_request
    expect(response).to have_http_status expected_status_code
  end

  if expected_json_schema
    it "matches the #{expected_json_schema.inspect} schema" do
      make_request
      expect(response).to match_response_schema expected_json_schema
    end
  end
end
