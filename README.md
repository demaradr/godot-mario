# Godot Platformer Prototype

A fast-paced 2D platformer prototype built in Godot 4.4. This is the first game project I tackled, and I developed it side-by-side with my brother. I focused on the gameplay programming while he created the art and pieced together the level layouts. Together we explored what it takes to bring a responsive platformer to life.

## Project Highlights
- **Responsive player controller** featuring tuned acceleration, a jump cutoff, and generous *coyote time* so jumps feel dependable.
- **Enemy behaviors** including a ground-based slime that patrols between walls and an airborne eyeball that swoops toward the player when they enter its detection range.
- **Hand-crafted level kit** assembled by my brother, showcasing the pixel art tiles, characters, and props he produced.
- **Godot-native workflow** leveraging the engine's input mapping, animation system, and node-based scene editing.

## My Contributions
- Implemented the player character in `Scripts/player.gd`, including:
  - Gravity handling that pauses during coyote time to keep mid-air control consistent.
  - Variable jump height by cutting upward velocity when the jump button is released.
  - Direction-aware sprite flipping for smooth character feedback.
- Authored all enemy AI scripts:
  - `Scripts/slime.gd` patrols horizontally, flips when raycasts hit walls, and keeps its idle animation playing.
  - `Scripts/eyeball.gd` idles in place until the player enters a trigger, then eases toward them while facing the right direction.
- Built simple kill zones and other gameplay helpers to tie the level together.

## My Brother's Contributions
- Drew the full set of character, enemy, and environment sprites.
- Designed and assembled the demo level inside Godot, arranging hazards and enemy placements to highlight the mechanics.

## Controls
- **Move:** `A / D` or `← / →`
- **Jump:** `Space`

You can remap these in the *Project Settings → Input Map* if you want different controls.

## How to Play Locally
1. [Install Godot 4.4](https://godotengine.org/download) (the project targets the Forward+ renderer).
2. Clone this repository and open the `project.godot` file in Godot.
3. Press <kbd>F5</kbd> in the editor to play, or export the project for your preferred platform.

## What I Learned
- How to tune 2D movement physics so they "feel right" to players.
- Using timers and state flags to implement quality-of-life features like coyote time.
- Structuring AI logic with Godot nodes, raycasts, and signals.
- Collaborating across disciplines—my brother and I iterated together to match the art and gameplay vibes.

## Future Improvements
- Expand the moveset with wall jumps or dash mechanics.
- Add boss encounters and more enemy varieties that build on the existing AI framework.
- Polish the UI and audio with feedback for collecting items and defeating enemies.
- Package a short story-driven campaign that showcases the level art even more.

---
Thanks for checking out the project! I'm proud of how much we accomplished on our first attempt at shipping a playable platformer, and I'm excited to keep building on this foundation.
