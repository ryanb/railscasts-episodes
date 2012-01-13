pirates = Blog.create! name: "Pirates", subdomain: "pirates"
ninjas = Blog.create! name: "Ninjas", subdomain: "ninjas"
robots = Blog.create! name: "Robots", subdomain: "robots"


lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

pirates.articles.create! name: "Ahoy! Learen to Talk Like a Pirate",
                        published_at: 2.weeks.ago,
                        content: lorem
pirates.articles.create! name: "Finding Your First Parrot",
                        published_at: 5.weeks.ago,
                        content: lorem
pirates.articles.create! name: "We are the Pirates Who Don't Do Anything",
                        published_at: 9.weeks.ago,
                        content: lorem

ninjas.articles.create! name: "How to Throw a Ninja Star",
                        published_at: 2.weeks.ago,
                        content: lorem
ninjas.articles.create! name: "3 Tips to Stay Hidden",
                        published_at: 7.weeks.ago,
                        content: lorem

robots.articles.create! name: "How to Get Along with Humans",
                        published_at: 1.weeks.ago,
                        content: lorem
robots.articles.create! name: "3 Laws of Robotics",
                        published_at: 5.weeks.ago,
                        content: lorem
