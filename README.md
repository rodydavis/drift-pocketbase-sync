# drift-pocketbase-sync

This is a simple Flutter project that demonstrates how to sync a [Pocketbase](https://pocketbase.io/) database with a [Flutter](https://flutter.dev) [SQLite](https://sqlite.org/) database via [drift](https://drift.simonbinder.eu/) without using a CRDT.

## Getting Started

### Run the server

```bash
make dev 
```

### Create an admin account

Create an admin account for testing:
- Username: `admin@email.com`
- Password: `admin123456`

### Import the collections

Import the `pb_schema.json` file into your Pocketbase admin dashboard.

### Run the tests

```bash
flutter test
```

## Update the generated code

After making any changes to the schema in Pocketbase, you need to regenerate the client code.

The client needs to be in sync with the server to ensure schema alignment.

### Regenerate the client schema

To update the generated code, run the following command:

```bash
make generate
```

This will run the generate command, which you can change the admin username and password variables in the Makefile.

Drift does support schema migrations, see the [documentation](https://drift.simonbinder.eu/docs/migrations/) for more information.

## FAQ

### Why not use a CRDT?

CRDTs are great for eventual consistency, but they can be complex to implement and maintain. This project demonstrates how to sync a Pocketbase database with a Flutter SQLite database without using a CRDT by using a simple sync algorithm since the PocketBase server is a single source of truth and the date time for created/updated are always in order.

### How do I generate new IDs on the client?

The code for generating a new ID is take directly from the Pocketbase codebase.

```dart
final id = Database.newId();
```

### How do I sync the data?

To sync the data call the sync command:

```dart
final Database db = ...;
final PocketBase pb = ...;
final service = SyncService(db, pb);
await service.syncCollections();
```

This will first check for any new deletes and remove them from the local database.

Then it will check for any new or updated records and add them to the local database.

Finally, it will check the local database for any new or updated records and add them to the Pocketbase database.

### How are deletes handled?

Deletes are soft deletes first on both the server and the client. There is a hook to add the deleted record to a special table for later cleanup.

This table is cleaned up after a certain period of time.

### Can I use this with a precompiled Pocketbase database?

No, this requires extending the PocketBase [server with go](https://pocketbase.io/docs/go-overview/). It might be possible with [pb_hooks and JS](https://pocketbase.io/docs/js-overview/).
