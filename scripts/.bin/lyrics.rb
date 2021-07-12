#!/usr/bin/env ruby

require "date"

STATUSES = [
  "Hope Rides Alone",
  "There's no man or machine who can stop me",
  "There are no heroes left in man",
  "With these hands, we will destroy",
  "With these hands, we will rebuild",
  "Whatever's on the table plays",
  "You can't just set the world at someone else's feet",
  "Here comes the arm",
  "Fear not the task ahead, there's no escaping it",
  "There's no good nor evil here",
  "Freedom doesn't exist",
  "Onward I go once again",
  "Only victory can bring me home",
  "I am the wind that shapes the land",
  "Oceans arise at my command",
  "I've nothing without sacrifice",
  "Fear not your anger",
  "Open wide, embrace the afterlife"
]

now = Time.now

Random.srand now.yday

puts STATUSES.shuffle[now.hour % STATUSES.length]
