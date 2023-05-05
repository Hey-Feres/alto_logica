### Running the app

Open terminal in the project root and type:

```bash
bundle
ruby app.rb
```

### Description

Ruby used: `3.0.0`

**Gems**

`RSpec`

The decision to go with RSpec for testing was based only on my personal habit of testing. The other tool I would be able to test is MiniTest.

`Byebug`

Byebug was added just for debugging purposes. It is not used in the code actively.

### Testing

```bash
bundle
rspec
```

> Notice that 2 of the 3 test cases given, fails.
> The 2nd test case fails missing 2 cents on:
> - imported bottle of perfume
> - Sales Taxes
> - Total

> The 3rd test case fails missing 11 cents on:
> - imported boxes of chocolates
> - Sales Taxes
> - Total

> Honestly, whiting the given time, I could not figure out where in the maths I'm losting those cents. I'm aware of the importance of not let those decimals values get lost in the industry you works, but I decided that would be better deliver the test witing the time, even with the errors.