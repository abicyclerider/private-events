# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Rails 8.0.3 application for The Odin Project's "Private Events" assignment - building an event management site similar to Eventbrite where users can create events and attend events created by others.

**Core Features to Build:**
- User authentication (using Devise)
- Users can create events (with date and location)
- Users can attend multiple events
- Events can have multiple attendees
- Separate views for past and upcoming events
- Show event creators and attendees

**Key Learning Goals:**
- Complex ActiveRecord associations (many-to-many through join table)
- Event scoping by date
- User authentication integration

**Tech Stack:**
- PostgreSQL as the database
- Hotwire (Turbo + Stimulus) for frontend interactivity
- Propshaft for asset pipeline
- Solid Cache, Solid Queue, and Solid Cable for Rails.cache, Active Job, and Action Cable
- Kamal for Docker-based deployment

## Database Setup

The application uses multiple PostgreSQL databases in production:
- `private_events_production` - primary database
- `private_events_production_cache` - for Solid Cache (migrations in `db/cache_migrate/`)
- `private_events_production_queue` - for Solid Queue (migrations in `db/queue_migrate/`)
- `private_events_production_cable` - for Solid Cable (migrations in `db/cable_migrate/`)

Development and test environments use single databases: `private_events_development` and `private_events_test`.

## Common Commands

**Database:**
```bash
bin/rails db:create          # Create databases
bin/rails db:migrate         # Run migrations
bin/rails db:seed            # Load seed data
bin/rails db:reset           # Drop, create, migrate, and seed
```

**Server:**
```bash
bin/rails server             # Start development server (or bin/rails s)
bin/dev                      # Start with all processes (if foreman/overmind configured)
```

**Testing:**
```bash
bin/rails test               # Run all tests
bin/rails test test/models/user_test.rb           # Run specific test file
bin/rails test test/models/user_test.rb:10        # Run test at specific line
bin/rails test:system        # Run system tests only
```

**Code Quality:**
```bash
rubocop                      # Run RuboCop linter (uses rubocop-rails-omakase)
rubocop -a                   # Auto-correct offenses
brakeman                     # Run security vulnerability scanner
```

**Console:**
```bash
bin/rails console            # Start Rails console (or bin/rails c)
```

## Architecture Notes

- This is a fresh Rails 8 application with standard MVC structure
- Uses minitest for testing (not RSpec)
- Follows Rails Omakase Ruby styling conventions via rubocop-rails-omakase
- Configured for deployment with Kamal (Docker-based) and Thruster (HTTP acceleration)
