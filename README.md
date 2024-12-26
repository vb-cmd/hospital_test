# README
If you are running the project for the first time, you need to enter these commands.
```
bin/rails db:create db:migrate db:seeds
```

#### AdminUser
    email: admin@example.com
    password: password

#### Patients
```
    phone: '+1234567890', '+1234567891', '+1234567893', '+1234567894', '+1234567895'
    password: password
```

#### Doctors
```
    phone: '+2234567890', '+2234567891', '+2234567893', '+2234567894', '+2234567895'
    password: password
```

### Production:

```Ruby
ENV["PSQL_DATABASE"]
ENV["PSQL_USERNAME"]
ENV["PSQL_PASSWORD"]
ENV["PSQL_HOST"]
ENV["PSQL_PORT"]
```
