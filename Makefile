CC=g++
CFLAGS=-O2 -c -Wall -w -fomit-frame-pointer
LDFLAGS=-O2 -lz -fomit-frame-pointer
DCFLAGS=-g -c -Wall -w
DLDFLAGS=-g -lz
SOURCES=main.cpp helper.cpp nbt.cpp draw.cpp colors.cpp worldloader.cpp filesystem.cpp globals.cpp
OBJECTS=$(SOURCES:.cpp=.default.o)
OBJECTS_TURBO=$(SOURCES:.cpp=.turbo.o)
DOBJECTS=$(SOURCES:.cpp=.debug.o)
EXECUTABLE=mcmap

# default, zlib shared
all: $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $(EXECUTABLE)

# use this one on windows so you don't have to supply zlib1.dll
static: $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -static -o $(EXECUTABLE)

# debug, zlib shared
debug: $(DOBJECTS)
	$(CC) $(DOBJECTS) $(DLDFLAGS) -o $(EXECUTABLE)

# use this to build a binary optimized for your cpu - not recommended for distribution
turbo: $(OBJECTS_TURBO)
	$(CC) $(OBJECTS_TURBO) $(LDFLAGS) -march=native -mtune=native -o $(EXECUTABLE)

clean:
	rm *.o

%.default.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

%.turbo.o: %.cpp
	$(CC) $(CFLAGS) -march=native -mtune=native $< -o $@

%.debug.o: %.cpp
	$(CC) $(DCFLAGS) $< -o $@
