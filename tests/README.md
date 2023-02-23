# Tests

The simplest test is to just run the source plugin directly from the interpreter. The [source plugin](../plugins/event_source/nautobot_changelog.py) has the simple entrypoint needed in order to run this plugin without the need for ansible-rulebook command.

First step would be to active the `poetry shell`.  This will put you into a python poetry virtualenv.

```sh
▶ poetry shell
Creating virtualenv jeffkala-nautobot-eda-collection-9uT_z6Oq-py3.9 in /Users/jeffkala/Library/Caches/pypoetry/virtualenvs
Spawning shell within /Users/jeffkala/Library/Caches/pypoetry/virtualenvs/jeffkala-nautobot-eda-collection-9uT_z6Oq-py3.9

(jeffkala-nautobot-eda-collection-py3.9) 
~/repo-clones/jeffkala-nautobot-eda-collection
```

Next, we can install the package with `poetry install`.

```sh
(jeffkala-nautobot-eda-collection-py3.9) 
▶ poetry install
Installing dependencies from lock file

Package operations: 60 installs, 1 update, 0 removals

  • Installing pycparser (2.21)
  • Installing cffi (1.15.1)
  • Installing markupsafe (2.1.2)
  • Installing attrs (22.2.0)

<----output omitted---->
```

Next, setup the required environment variables to be able to execute it locally.

```sh
export NAUTOBOT_HOST="https://demo.nautobot.com"
export NAUTOBOT_TOKEN="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
```

Finally, we can run the source plugin natively within the virutalenv.

```sh
(jeffkala-nautobot-eda-collection-py3.9) 
~/repo-clones/jeffkala-nautobot-eda-collection
▶ poetry run python plugins/event_source/nautobot_changelog.py
Waiting for events in Nautobot ChangeLog...

{'id': '0cc0b56a-3894-403b-9ffc-de65da564c60', 'display': 'dcim | device azd01-dist-01 updated by demo', 'url': 'https://demo.nautobot.com/api/extras/object-changes/0cc0b56a-3894-403b-9ffc-de65da564c60/', 'time': '2023-02-23T01:29:43.007930Z', 'user'........

<----output omitted---->
```

At this point the debug outputs from the script will provide you all the information you need. As new changes are logged to the changelog in Nautobot you will see them in the terminal output.
