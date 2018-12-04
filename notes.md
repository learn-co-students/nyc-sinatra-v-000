1. Form functionality: If I'm creating radio buttons to choose one option but there's also a write-in option, how do I make it
either/or?


2. Okay I have got a lot of my capybara test issues worked out, I'm finally lining up my rspec errors with the functionality problems
I'm experiencing through shotgun, that I can assign new titles and landmarks to a new figure but can't get them to come in when I click the buttons

2(update) FASCINATING. I just built out my edit form, which is mostly the same code and the buttons and/or write ins are being successfully added, when the new form wasn't.

^^^solved the problem: mass assignment!! I originally had @figure = Figure.create(name: params[:figure][:name]), which although that successfully assigns the name, it doesn't assign anything else in the figure params (it took me such a long time to figure out the syntax of [:][:] since I hadn't had the capybara test ask for that kind of name of figure[name] before, which makes sense if you think about how that's calling a key inside a hash, and we already know that params is a hash, so its double nested to not confuse figure names with lankmark names.) BUT if you just assign the simple @figure = Figure.create(params[:figure]), it'll take care of anything inside that hash, including, of course, the figure[:name] element. Duh. YAY I actually debugged on my own!!! haha
