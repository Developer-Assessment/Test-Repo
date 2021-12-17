When(/^I send a POST request to "(.*)" with the following:$/) do |endpoint, table|
  page.driver.post(endpoint, table.rows_hash)
end

Then(/^I receive following json response:$/) do |message|
  JSON.parse(page.body) == JSON.parse(message)
end

And(/^The response status should be "(.*)"$/) do |response_code|
  expect(page.status_code).to eq(response_code.to_i)
end