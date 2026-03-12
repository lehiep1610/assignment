# assignment

A assignment project

## Requirement 
- Flutter SDK `^3.x`
- Dart SDK `^3.x`
- iOS Simulator / Android Emulator or a phýical device

## Setup & Running

```bash
# 1. Clone the repository
git clone https://github.com/lehiep1610/assignment.git
cd assignment

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```
> No API keys or backend services required. All data is served via mock datasources with simulated network delays.

## Login Credentials

The login screen accepts any valid email format and a non-empty password.

**Example:**
- Email: `test@example.com`
- Password: `123456`

> No real authentication is performed. Any email address in a valid format combined with any non-empty password will grant access to the app.
---

## Architecture Approach

This project follows a feature-first layered architecture rather than a strict implementation of Clean Architecture. The decision was intentional and based on the scope of the assignment.

The application structure is organized into two main layers within each feature:

```
feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
└── presentation/
    ├── pages/
    ├── view_data/
    └── widgets/
```

The data layer is responsible for:
- network requests
- data models
- repository implementations

The presentation layer contains:
- UI pages
- UI widgets
- view composition logic

This separation ensures that UI code does not directly handle networking concerns and keeps the feature modular and maintainable.

## Why Not Full Clean Architecture?

A strict Clean Architecture setup would normally introduce additional layers such as:

```
domain/
  entities
  repository contracts
  use cases
```

However, for this assignment the domain complexity is relatively small. The Explore feature primarily performs remote data fetching and UI rendering without complex business rules or domain logic.

Introducing a full domain layer (entities, use cases, repository contracts, mapping layers, dependency injection setup, etc.) would significantly increase the amount of boilerplate without providing meaningful architectural benefits for the current scope.

Therefore, a lighter layered approach was chosen to:

- keep the codebase simple and readable
- reduce unnecessary abstraction
- focus on UI implementation and design fidelity
- deliver a working feature set within the limited assignment timeframe

## Trade-offs

This approach intentionally trades architectural purity for simplicity and faster delivery.

Compared to strict Clean Architecture, the current structure means:

- repository interfaces live closer to the data layer
- presentation may work with data models directly
- use cases are not introduced yet
- dependency wiring is simplified

These trade-offs reduce structural overhead while still maintaining a clear separation between data fetching and UI rendering.

## Scalability and Migration Path

Even though the architecture is lightweight, the project structure was designed so that it can evolve into full Clean Architecture if the project grows.

The migration path would be straightforward:

1. Introduce a domain layer.
2. Move repository interfaces into domain/repositories.
3. Introduce domain entities.
4. Map data models to domain entities inside repository implementations.
5. Add use cases for business logic.
6. Introduce dependency injection (e.g., get_it).
7. Introduce state management for feature orchestration.

Because features are already organized modularly, these changes can be applied incrementally without large structural refactoring.

## Design Goal

The goal of this architecture was to balance:

- clarity
- maintainability
- simplicity
- scalability
- while avoiding unnecessary complexity for a relatively small feature set.

## Key Implementation Notes

- **Design tokens** — colors, spacing, typography, and radius are all centralized in `app/theme/`. A design change requires updating one file only.
- **Onboarding background** - Onboarding is usually a static page, so there’s no need to use complex widgets like `StaggeredGrid`. A simple Row and Column are enough to do the trick.
- **Custom BottomNavBar** — Flutter's `BottomNavigationBar` does not support gradient text natively. Replaced with a custom widget using `ShaderMask`.
- **Tab state preservation** — `DashboardShell` uses `IndexedStack` so each tab retains its state when switching.
- **Tab slide transition** — When switching tabs, the incoming page slides in from the left or right depending on the direction of navigation. Implemented via `AnimationController` + `FractionalTranslation` wrapping the `IndexedStack`, so animation and state preservation work independently without interfering with each other. No `AutomaticKeepAliveClientMixin` is needed since `IndexedStack` never disposes its children.
- **Form validation** — `FormValidators` class + `isValidEmail` String extension. Logic is decoupled from UI and easy to unit test.
- **Responsive layout** — `LayoutBuilder` at page level drives card sizing. No hardcoded pixel widths; heights are derived from `cardWidth / aspectRatio`.
