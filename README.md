# ticker-phoenix

**ticker-phoenix** is an example Elixir Phoenix app which provides an API for pulling stock quotes from the (defunct but still available) Google Finance API by using the [ticker-elixir](https://github.com/philcallister/ticker-elixir) Elixir OTP app. Clients can subsribe to Phoenix Channels with stock ticker symbols and be periodically notified of updates.

To see the **ticker-phoenix** app in action, head over to
- [ticker-elixir](https://github.com/philcallister/ticker-elixir) Elixir OTP app
- [ticker-react] (https://github.com/philcallister/ticker-react) React app

##### Example screenshot of the three applications being used together
![Stock Ticker](/screen-shot.gif?raw=true "Stock Ticker Example")

## Environment

The sample was developed using the following 

- Elixir 1.3.4
- OS X El Capitan (10.11)

**Note:** Pull the **elixir_1.4** branch to use Elixir 1.4.

## Setup

Clone Repo
```bash
git clone https://github.com/philcallister/ticker-phoenix.git
```

Dependencies
```bash
mix deps.get
```
```bash
mix deps.compile
```

## Run It

Start the server

```bash
mix phoenix.server
```

OR within ```iex```

```bash
iex -S mix phoenix.server
```

## License

[MIT License](http://www.opensource.org/licenses/MIT)

**Free Software, Hell Yeah!**
