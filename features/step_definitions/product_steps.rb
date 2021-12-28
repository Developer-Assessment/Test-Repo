When(/^To create product I send a POST request to "(.*)" with following parameters$/) do |endpoint, table|
    page.driver.post(endpoint, table.rows_hash)
end
  
Then(/^I receive following JSON response from create product API$/) do |message|
    JSON.parse(page.body) == JSON.parse(message)
end

And(/^The response status of create product API should be "(.*)"$/) do |response_code|
    expect(page.status_code).to eq(response_code.to_i)
end