# # frozen_string_literal: true

# When(/^To create user I send a POST request to "(.*)" with the following$/) do |endpoint, table|
#   page.driver.post(endpoint, table.rows_hash)
# end

# Then(/^I receive following JSON response from create user API$/) do |message|
#   JSON.parse(page.body) == JSON.parse(message)
# end

# And(/^The response status of create user API should be "(.*)"$/) do |response_code|
#   expect(page.status_code).to eq(response_code.to_i)
# end
