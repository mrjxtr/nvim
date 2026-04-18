CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- name: GetUser :one
SELECT * FROM users
WHERE id = $1;

-- name: ListUsersByEmail :many
SELECT * FROM users
WHERE email = sqlc.arg(email_filter);

-- name: UpdateUserEmail :exec
UPDATE users SET email = sqlc.narg('new_email')
WHERE id = $1;

-- name: GetUserWithProfile :one
SELECT sqlc.embed(users) FROM users
WHERE id = $1;
