---
layout: cuke
title: features/tests/map/Map.feature
feature: Map Search
scenarios: ["Search for The Shard", "Search for BlueFin"]
tags: ["ooooh"]
---
```cucumber
Feature: Map Search

  In order to find information about places
  As a curious person
  I want to be able to get information about places I search for

  Background:
    Given I am on the google homepage
    And I open the maps app

  @ooooh
  Scenario: Search for The Shard
    When I search for a location "the shard"
    Then I should see information about "The Shard"

  Scenario: Search for BlueFin
    When I search for a location "Blue Fin Venue"
    Then I should see information about "Blue Fin Venue"
    And I should see the address "110 Southwark St, London SE1 0SU"
```
