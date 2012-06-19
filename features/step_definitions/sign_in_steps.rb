When /^I click on the landing image$/ do
  %{When I follow "Launch_fb"}
end

Then /^I should be signed into sureify app$/ do
  %{Then I should see "SUREIFY"}
  %{Then I should see "Work"}
  %{Then I should see "Birthday"}
  %{Then I should see "Relationship"}
end