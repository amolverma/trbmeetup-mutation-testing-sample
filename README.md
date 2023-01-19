# trbmeetup-mutation-testing-sample

Sample code and slides for a [presentation I gave at the Tokyo Rubyist Meetup](
https://trbmeetup.doorkeeper.jp/events/148936), titled "An introduction to
mutation testing in Ruby".

Slides are in the `slides` directory. Source code is in `lib`. Tests are in
`spec`.

## Setup

```bash
bundle install
```

## Playing through the mutation testing demo

If you would like to recreate the demo I used during the presentation, here's
how to do it:

```bash
# 1. Check out the starting state of the demo
git checkout demo_start

# 2. Run tests
bundle exec rspec

# 3. Run mutant
bundle exec mutant run --include lib --require customer --use rspec -- Customer

# 4. Check out and display the next commit, which should have changes that
# address the first issue that the mutant run pointed out:
git checkout `git log --reverse --ancestry-path HEAD..demo_end \
  | head -n 1 \
  | cut -d \  -f 2` \
  && git show

# Repeat steps 3 and 4 until you can't anymore!
```

When I gave the presentation, I used Ruby 3.1.3, but there's not really much in
here that's incompatible with other recent versions of Ruby.

Feel free to contact me with any questions you may have, and happy mutation
testing!
