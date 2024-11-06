#include <neorv32_iceduino.h>
#include "gol.h"

bool currentGen[GRIDSIZE][GRIDSIZE];
bool nextGen[GRIDSIZE][GRIDSIZE];
bool borderFields[BORDERFIELDS_LENGTH];

bool newBorderFieldsGen0[BORDERFIELDS_LENGTH] = {0,1,0,1,0,1,0,1,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,0,1,0,1,0,1};
bool newBorderFieldsGen1[BORDERFIELDS_LENGTH] = {0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0};
bool newBorderFieldsGen2[BORDERFIELDS_LENGTH] = {0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0};

RGBColor aliveColor;
RGBColor deadColor;

uint8_t generation = 0;

// updates next generation based on the current generation and its neighbours
void updateGeneration() {
    uint8_t liveNeighbours;

    for (uint8_t x = 0; x < GRIDSIZE; x++) {
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
            liveNeighbours = 0;
            
            // Check all 8 neighbors of the main field
            for (int8_t i = -1; i <= 1; i++) {
                for (int8_t j = -1; j <= 1; j++) {
                    if (i == 0 && j == 0) {
                        continue; // Skip the cell itself
                    }
                    
                    int8_t nx = (int8_t) x + i;
                    int8_t ny = (int8_t) y + j;
                    
                    // Check if neighbour is within bounds
                    if (nx >= 0 && nx < GRIDSIZE && ny >= 0 && ny < GRIDSIZE) {
                        if(currentGen[nx][ny]){
                            liveNeighbours ++;
                        }
                    } 
                    else {
                        // left border wihout top left corner
                        if (nx == -1 && ny >= 0 && ny <= GRIDSIZE) {
                            liveNeighbours += borderFields[36 - ny - 1];
                        }
                        // right border without top right corner
                        if (nx == GRIDSIZE && ny >= 0 && ny <= GRIDSIZE) {
                            liveNeighbours += borderFields[ny + 10 ];
                        }
                        // whole top border 
                        if (ny == -1 && nx >= -1 && nx <= GRIDSIZE) {
                            liveNeighbours += borderFields[nx + 1];
                        }
                        // bottom corner without bottom right corner and bottom left corner
                        if (ny == GRIDSIZE && nx >= 0 && nx <= GRIDSIZE - 1) {
                            liveNeighbours += borderFields[27 - (nx + 1)];
                        }
                    }
                }
            }

            // Apply the rules of Game of Life
            if (currentGen[x][y]) { // The cell is alive
                if (liveNeighbours < 2 || liveNeighbours > 3) {
                    nextGen[x][y] = false; // Dies
                } else {
                    nextGen[x][y] = true; // Lives on
                }
            } else { // The cell is dead
                if (liveNeighbours == 3) {
                    nextGen[x][y] = true; // Becomes alive
                } else {
                    nextGen[x][y] = false; // Stays dead
                }
            }
        }
    }

    // copy nextGen to currentGen for the next iteration
    for (uint8_t x = 0; x < GRIDSIZE; x++) {
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
            currentGen[x][y] = nextGen[x][y];
        }
    }
}

// sets an LED in the WS2812 matrix
// converts from cartesian to snake index
void controlWS2812Cell(bool state, uint8_t x, uint8_t y){
    uint8_t index;

    // convert cartesian coordinate to snake index
    index = y * GRIDSIZE + x;

    if (state == true){
        // LED on
        iceduino_ws2812_set(index, aliveColor.red,aliveColor.green,aliveColor.blue);
    } else {
        // LED off
        iceduino_ws2812_set(index, deadColor.red,deadColor.green,deadColor.blue);
    }
}

// setter for the whole border cells buffer
void setBorderFields(bool newBorderFields[BORDERFIELDS_LENGTH]){
    for(int i = 0; i < BORDERFIELDS_LENGTH; i++){
        borderFields[i] = newBorderFields[i];
    }
}

// local testing function, to set the appropriate generation of borderFields, for correct generation calculation
void updateGenLocally(){
    switch (generation){
        case 0: setBorderFields(newBorderFieldsGen0);
            generation ++;
            break;
        case 1: setBorderFields(newBorderFieldsGen1);
            generation ++;
            break;
        case 2: setBorderFields(newBorderFieldsGen2);
            generation = 0;
            break;
    }
    updateGeneration();
}

// Displays the current Generation on the LED-matrix
void displayCurrentGen(){
    for(int x = 0; x < GRIDSIZE; x ++){
        for(int y = 0; y < GRIDSIZE; y++){
            bool currentCell = currentGen[x][y];
            controlWS2812Cell(currentCell, x,y);
        }
    }
}
