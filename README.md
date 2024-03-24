# The Snowball Game

---
## Initial Ideas

To fight against the problem of scope-creep the project will be completed in stages

### Stage 1 - Working game (Free for all mode)
- [ ] Timed mode
- [ ] 3d game, fixed isometric camera
- [ ] 2-8 players; 8 direction movement, can roll / interact with snowballs
- [ ] Snowballs can be started and then roll along, picking up snow on the ground as they go
- [ ] Snow on the ground interacts with snowball and disappears
- [ ] Snowballs can be placed as the start of a snowman
- [ ] Snowballs can be added to fixed snowballs when next to them
  - [ ] Only if it is smaller than the fixed snowball
- [ ] Points displayed after each snowman is finished (3 Snowball stack)
  - [ ] +points for completed snowman (modified by size)
	- [ ] Calculated with the radius of the three Snowballs used to make the snowman
  - [ ] +points for correctness of the Snowman
	- [ ] Calculated with the ratio between each snowball - how close this ratio is to the ideal
	- [ ] Percentage based points, more bonus points for bigger snowmen
- [ ] When three snowballs have been added together to create one Snowman, The model has carrot, hat, eyes, buttons etc. added to it and it is then fixed as an entity

#### Further Targets
- [ ] Snowballs have lower velocity depending on how large they are
- [ ] Win Screen
  - [ ] With Statistics?
- [ ] Title screen design
- [ ] Main Menu design

<br>

At this point, the game is a finished product, now to add more modes and features!

### Stage 2 - Teams mode
- [ ] Timed mode
- [ ] Two teams
  - [ ] Players from the same team can add to that Team's snowmen
  - [ ] Players from the same team cannot be hit by their team's snowballs
	- [ ] Friendly fire toggle

#### PvP
- [ ] Throwing snowballs, different from the rolled snowballs
  - [ ] Press a button to pick up a throwable snowball
- [ ] Can kick snowballs away

**Further PvP target**
- [ ] Multiple Stage Designs
- [ ] Hills that snowballs can be rolled down and kicked from (gravity)
- [ ] More than two teams - up to 4

<br>

### Stage 3 - Snowfall mode
- [ ] Falling snow
- [ ] Points goal
- [ ] Snow replenishes on the ground as the game goes on
- [ ] Timer until next snowing event when snow will build up on the ground
- [ ] Five Stages of asset/ sprite to let the user know how much snow is in each position
