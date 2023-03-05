Debug now with
```
bundle exec rdbg --open -n -c -- bundle exec rails s
```

launch.json
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "rdbg",
            "name": "Attach with rdbg",
            "request": "attach"
        }
    ]
}
```

Install this extension
```
https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg
```