// Select all the tiles
const tiles = document.querySelectorAll('td');

const canMove = (tile) => {
  // TODO: Check if a tile has an empty neighbour
  const tileCellIndex = tile.cellIndex;
  const tileRowIndex = tile.parentNode.rowIndex;

  const emptyTile = document.querySelector(".empty");
  const emptyTileCellIndex = emptyTile.cellIndex;
  const emptyTileRowIndex = emptyTile.parentNode.rowIndex;

  // check left tile
  if (tileCellIndex === emptyTileCellIndex + 1 && tileRowIndex === emptyTileRowIndex) {
    return true;
  }
  // check right tile
  if (tileCellIndex === emptyTileCellIndex - 1 && tileRowIndex === emptyTileRowIndex) {
    return true;
  }
  // check up tile
  if (tileRowIndex === emptyTileRowIndex + 1 && tileCellIndex === emptyTileCellIndex) {
    return true;
  }
  // check down tile
  if (tileRowIndex === emptyTileRowIndex - 1 && tileCellIndex === emptyTileCellIndex) {
    return true;
  }

  return false;
};

const moveTile = (element) => {
  // TOOD: Move the tile
  const emptyTile = document.querySelector(".empty");
  element.classList.add("empty");
  emptyTile.classList.remove("empty");

  const tileContent = element.innerText;
  const emptyTileContent = emptyTile.innerText;
  element.innerText = emptyTileContent;
  emptyTile.innerText = tileContent;
};

const checkIfPlayerWins = () => {
  // TODO: Check if player has won
  const currentTiles = document.querySelectorAll('td');
  const tilesArray = Array.from(currentTiles);
  const tilesValues = tilesArray.map((tile) => Number.parseInt(tile.innerHTML, 10)).filter((value) => !Number.isNaN(value));
  const tilesValuesAsString = tilesValues.join(',');
  // if sorted in ascending order, the player wins
  const winningValues = tilesValues.sort((a, b) => a - b);
  const winningValuesAsString = winningValues.join(',');
  if (tilesValuesAsString === winningValuesAsString) {
    alert('You won!');
  }
};

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener('click', () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
