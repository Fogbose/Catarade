# Catarade : Catan-Like Game Project

Welcome to a Catan-Like Game project! This game is inspired by the popular board game Catan, with modified rules for a personalized experience. It is developed using the Godot Engine. The game focuses on custom board generation and customizable game rules.

Example of the hexagonal board layout in development.

![Catan default board layout ](http://url/to/img.png)

## Table of Contents

1. [Project Overview](#project-overview)
2. [Installation and Setup](#installation-and-setup)
3. [Game Features](#game-features)
4. [Architecture Overview](#architecture-overview)
5. [How to Contribute](#how-to-contribute)
6. [Roadmap](#roadmap)
7. [License](#license)
8. [Links](#Links)

## Project Overview

This project aims to recreate the Catan game mechanics. The goal is to implement:

    - Custom board generation with customizable layouts.
    - Resources management based on tile types.
    - Player interactions including placement of roads, settlements, and cities.
    - Procedural terrain generation with possible customization by the player.
    - Scalability to extend or modify rules in the future.

The project is built using Godot 4.

## Installation and Setup

### Prerequisites

    - Godot Engine 4.x

### Steps

    - Clone the repository:

    ```console
    git clone https://github.com/yourusername/Catarade.git
    cd Catarade
    ```

    - Open the project in Godot:
        - Launch Godot.
        - Click on Import and select the project’s folder.

    - Run the game from the editor by pressing F5.

For more detailed installation instructions and troubleshooting, refer to the Installation Guide.

### Game Features

Here’s a brief overview of the key features implemented so far:

    - [ ] Hexagonal Tile System: The board is constructed using hexagonal tiles, with different resources and probabilities assigned to each.

    - [ ] Hexagonal grid system that follows the classic layout of Catan.

    - [ ] Procedural Board Generation: Generate random or predefined board layouts. Players can also modify the layout before the game starts.

    - [ ] Board generation flowchart illustrating the procedural generation pipeline.

    - [ ] Resource Allocation: Each hexagonal tile produces resources based on dice rolls, and resources are distributed to players with adjacent settlements.

    - [ ] Player Interaction: Players can place settlements, cities, and roads around the board’s hexagonal grid. The game enforces valid placement rules.

More detailed game mechanics are available in the Game Mechanics Documentation.

### Architecture Overview

The game’s architecture follows the separation of concerns principle. The main modules include:

    - Board: Manages the hexagonal tile grid and procedural generation.
    - Tiles: Represents individual resource tiles on the board.
    - Players: Manages player resources, interactions, and placements.
    - GameManager: Coordinates the game flow, turns, and state transitions.

For a detailed architecture breakdown, including class diagrams and flowcharts, visit the Architecture Documentation.

### Board Architecture Example

Below is a basic UML diagram illustrating how the board and tile classes interact:

Class diagram showing relationships between the board, tiles, and player objects.
How to Contribute

We welcome contributions to improve the game or expand its features. Here’s how you can help:

    - Fork the repository.
    - Create a new branch for your feature or bugfix.
    - Submit a pull request once your changes are complete.

Before contributing, please check the Contribution Guidelines and ensure that your code follows the established coding standards and is well-documented.
Roadmap

Here are some planned features and improvements:

- [ ] Implement AI players.
- [ ] Add multiplayer support.
- [ ] Enhance graphics and animations.
- [ ] Develop advanced game rules (e.g., expansions).
- [ ] Implement resource trading between players.

The full project roadmap can be found here.

### License

This project is licensed under the Mozilla Public License 2.0. See the LICENSE file for details.

### Links

    Game Mechanics Documentation
    Architecture Overview
    Roadmap
    Contribution Guidelines
    Godot Engine

For more information on the project, visit the Wiki.
