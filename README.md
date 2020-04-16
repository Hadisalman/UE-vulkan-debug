# UE-vulkan-debug

## Run locally
* Download the game binary.
    ```
    wget -c https://github.com/microsoft/AirSim/releases/download/v1.3.1-linux/Blocks.zip && 
    unzip Blocks.zip
    ```
* Run the game:
    - opengl4 **(Successful)**:
        ```
        ./Blocks/Blocks.sh -windowed -opengl4
        ```
    - opengl4 headless **(Successful)**: 
        ```
        DISPLAY= ./Blocks/Blocks.sh -windowed -opengl4
        ```
    - vulkan **(Successful)**:
        ```
        ./Blocks/Blocks.sh -windowed
        ```
    - vulkan headless **(FAIL)**:
        ```
        DISPLAY= ./Blocks/Blocks.sh -windowed
        ```

## Run in Docker
* Build the docker image
    ```
    docker build --network=host -t ue-vulkan -f Dockerfile .
    ```

* run the docker container:
    ```
    docker run --runtime=nvidia -it --rm --env "QT_X11_NO_MITSHM=1" --env DISPLAY=$DISPLAY --net=host --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" ue-vulkan /bin/bash 
    ```    
* Run the game inside the docker container
    - opengl **(Successful)**
        ```    
        ./Blocks/Blocks.sh -windowed -opengl4
        ```
    - opengl headless **(Successful)**
        ```
        DISPLAY= ./Blocks/Blocks.sh -windowed -opengl4
        ```    

    - vulkan **(FAIL)**
        ```
        ./Blocks/Blocks.sh -windowed
        ```
    - vulkan headless **(FAIL)**
        ```
        DISPLAY= ./Blocks/Blocks.sh -windowed
        ```        