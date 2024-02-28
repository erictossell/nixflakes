{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = {
      ".config/cava/config".text = ''

        [general]

        # Smoothing mode. Can be 'normal', 'scientific' or 'waves'. DEPRECATED as of 0.6.0
        ; mode = normal

        # Accepts only non-negative values.
        ; framerate = 60

        # 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
        # new as of 0.6.0 autosens of low values (dynamic range)
        # 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens. DEPRECATED as of 0.6.0
        ; autosens = 1
        ; overshoot = 20

        # Manual sensitivity in %. If autosens is enabled, this will only be the initial value.
        # 200 means double height. Accepts only non-negative values.
        ; sensitivity = 100

        # The number of bars (0-512). 0 sets it to auto (fill up console).
        # Bars' width and space between bars in number of characters.
        ; bars = 0
        ; bar_width = 2
        ; bar_spacing = 1
        # bar_height is only used for output in "noritake" format
        ; bar_height = 32

        # For SDL width and space between bars is in pixels, defaults are:
        ; bar_width = 20
        ; bar_spacing = 5

        # sdl_glsl have these default values, they are only used to calulate max number of bars.
        ; bar_width = 1
        ; bar_spacing = 0


        # Lower and higher cutoff frequencies for lowest and highest bars
        # the bandwidth of the visualizer.
        # Note: there is a minimum total bandwidth of 43Mhz x number of bars.
        # Cava will automatically increase the higher cutoff if a too low band is specified.
        ; lower_cutoff_freq = 50
        ; higher_cutoff_freq = 10000


        # Seconds with no input before cava goes to sleep mode. Cava will not perform FFT or drawing and
        # only check for input once per second. Cava will wake up once input is detected. 0 = disable.
        ; sleep_timer = 0


        [input]

        # Audio capturing method. Possible methods are: 'pulse', 'alsa', 'fifo', 'sndio' or 'shmem'
        # Defaults to 'pulse', 'pipewire', 'alsa' or 'fifo', in that order, dependent on what support cava was built with.
        # On Mac it defaults to 'portaudio' or 'fifo'
        # On windows this is automatic and no input settings are needed.
        #
        # All input methods uses the same config variable 'source'
        # to define where it should get the audio.
        #
        # For pulseaudio and pipewire 'source' will be the source. Default: 'auto', which uses the monitor source of the default sink
        # (all pulseaudio sinks(outputs) have 'monitor' sources(inputs) associated with them).
        #
        # For piepwire 'source' will be the object name or object.serial of the device to capture from.
        # Both input and output devices are supported.
        #
        # For alsa 'source' will be the capture device.
        # For fifo 'source' will be the path to fifo-file.
        # For shmem 'source' will be /squeezelite-AA:BB:CC:DD:EE:FF where 'AA:BB:CC:DD:EE:FF' will be squeezelite's MAC address
        ; method = pulse
        ; source = auto

        ; method = pipewire
        ; source = auto

        ; method = alsa
        ; source = hw:Loopback,1

        ; method = fifo
        ; source = /tmp/mpd.fifo
        ; sample_rate = 44100
        ; sample_bits = 16

        ; method = shmem
        ; source = /squeezelite-AA:BB:CC:DD:EE:FF

        ; method = portaudio
        ; source = auto


        [output]

        # Output method. Can be 'ncurses', 'noncurses', 'raw', 'noritake', 'sdl'
        # or 'sdl_glsl'.
        # 'noncurses' uses a custom framebuffer technique and prints only changes
        # from frame to frame in the terminal. 'ncurses' is default if supported.
        #
        # 'raw' is an 8 or 16 bit (configurable via the 'bit_format' option) data
        # stream of the bar heights that can be used to send to other applications.
        # 'raw' defaults to 200 bars, which can be adjusted in the 'bars' option above.
        #
        # 'noritake' outputs a bitmap in the format expected by a Noritake VFD display
        #  in graphic mode. It only support the 3000 series graphical VFDs for now.
        #
        # 'sdl' uses the Simple DirectMedia Layer to render in a graphical context.
        # 'sdl_glsl' uses SDL to create an OpenGL context. Write your own shaders or
        # use one of the predefined ones.
        ; method = ncurses

        # Orientation of the visualization. Can be 'bottom', 'top', 'left' or 'right'.
        # Default is 'bottom'. Other orientations are only supported on sdl and ncruses
        # output. Note: many fonts have weird glyphs for 'top' and 'right' characters,
        # which can make ncurses not look right.
        ; orientation = bottom

        # Visual channels. Can be 'stereo' or 'mono'.
        # 'stereo' mirrors both channels with low frequencies in center.
        # 'mono' outputs left to right lowest to highest frequencies.
        # 'mono_option' set mono to either take input from 'left', 'right' or 'average'.
        # set 'reverse' to 1 to display frequencies the other way around.
        ; channels = stereo
        ; mono_option = average
        ; reverse = 0

        # Raw output target. A fifo will be created if target does not exist.
        ; raw_target = /dev/stdout

        # Raw data format. Can be 'binary' or 'ascii'.
        ; data_format = binary

        # Binary bit format, can be '8bit' (0-255) or '16bit' (0-65530).
        ; bit_format = 16bit

        # Ascii max value. In 'ascii' mode range will run from 0 to value specified here
        ; ascii_max_range = 1000

        # Ascii delimiters. In ascii format each bar and frame is separated by a delimiters.
        # Use decimal value in ascii table (i.e. 59 = ';' and 10 = '\n' (line feed)).
        ; bar_delimiter = 59
        ; frame_delimiter = 10

        # sdl window size and position. -1,-1 is centered.
        ; sdl_width = 1000
        ; sdl_height = 500
        ; sdl_x = -1
        ; sdl_y= -1

        # set label on bars on the x-axis. Can be 'frequency' or 'none'. Default: 'none'
        # 'frequency' displays the lower cut off frequency of the bar above.
        # Only supported on ncurses and noncurses output.
        ; xaxis = none

        # enable alacritty synchronized updates. 1 = on, 0 = off
        # removes flickering in alacritty terminal emulator.
        # defaults to off since the behaviour in other terminal emulators is unknown
        ; alacritty_sync = 0

        # Shaders for sdl_glsl, located in $HOME/.config/cava/shaders
        ; vertex_shader = pass_through.vert
        ; fragment_shader = bar_spectrum.frag

        ; for glsl output mode, keep rendering even if no audio
        ; continuous_rendering = 0

        [color]
        ; background = default
        ; foreground = default

        # SDL and sdl_glsl only support hex code colors, these are the default:
        ; background = '#111111'
        ; foreground = '#00FF00'


        # Gradient mode, only hex defined colors are supported,
        # background must also be defined in hex or remain commented out. 1 = on, 0 = off.
        # You can define as many as 8 different colors. They range from bottom to top of screen
         gradient = 1
         gradient_count = 8
         gradient_color_1 = '#00ba69'
         gradient_color_2 = '#24c47a'
         gradient_color_3 = '#48ce8b'
         gradient_color_4 = '#6cd89c'
         gradient_color_5 = '#90e2ad'
         gradient_color_6 = '#b4ecbe'
         gradient_color_7 = '#d8f6cf'
         gradient_color_8 = '#ffffff'



        [smoothing]

        # Percentage value for integral smoothing. Takes values from 0 - 100.
        # Higher values means smoother, but less precise. 0 to disable.
        # DEPRECATED as of 0.8.0, use noise_reduction instead
        ; integral = 77

        # Disables or enables the so-called "Monstercat smoothing" with or without "waves". Set to 0 to disable.
        ; monstercat = 0
        ; waves = 0

        # Set gravity percentage for "drop off". Higher values means bars will drop faster.
        # Accepts only non-negative values. 50 means half gravity, 200 means double. Set to 0 to disable "drop off".
        # DEPRECATED as of 0.8.0, use noise_reduction instead
        ; gravity = 100


        # In bar height, bars that would have been lower that this will not be drawn.
        # DEPRECATED as of 0.8.0
        ; ignore = 0

        # Noise reduction, int 0 - 100. default 77
        # the raw visualization is very noisy, this factor adjusts the integral and gravity filters to keep the signal smooth
        # 100 will be very slow and smooth, 0 will be fast but noisy.
        ; noise_reduction = 77


        [eq]

        # This one is tricky. You can have as much keys as you want.
        # Remember to uncomment more than one key! More keys = more precision.
        # Look at readme.md on github for further explanations and examples.
        ; 1 = 1 # bass
        ; 2 = 1
        ; 3 = 1 # midtone
        ; 4 = 1
        ; 5 = 1 # treble

      '';

      ".config/cava/shaders/bar_spectrum.frag".text = ''
        #version 330

        in vec2 fragCoord;
        out vec4 fragColor;

        // bar values. defaults to left channels first (low to high), then right (high to low).
        uniform float bars[512];

        uniform int bars_count;    // number of bars (left + right) (configurable)
        uniform int bar_width;    // bar width (configurable), not used here
        uniform int bar_spacing;    // space bewteen bars (configurable)

        uniform vec3 u_resolution; // window resolution

        //colors, configurable in cava config file (r,g,b) (0.0 - 1.0)
        uniform vec3 bg_color; // background color
        uniform vec3 fg_color; // foreground color

        uniform int gradient_count;
        uniform vec3 gradient_colors[8]; // gradient colors

        vec3 normalize_C(float y,vec3 col_1, vec3 col_2, float y_min, float y_max)
        {
            //create color based on fraction of this color and next color
            float yr = (y - y_min) / (y_max - y_min);
            return col_1 * (1.0 - yr) + col_2 * yr;
        }

        void main()
        {
            // find which bar to use based on where we are on the x axis
            float x = u_resolution.x * fragCoord.x;
            int bar = int(bars_count * fragCoord.x);

            //calculate a bar size
            float bar_size = u_resolution.x / bars_count;

            //the y coordinate and bar values are the same
            float y =  bars[bar];

            // make sure there is a thin line at bottom
            if (y * u_resolution.y < 1.0)
            {
              y = 1.0 / u_resolution.y;
            }

            //draw the bar up to current height
            if (y > fragCoord.y)
            {
                //make some space between bars basen on settings
                if (x > (bar + 1) * (bar_size) - bar_spacing)
                {
                    fragColor = vec4(bg_color,1.0);
                }
                else
                {
                    if (gradient_count == 0)
                    {
                        fragColor = vec4(fg_color,1.0);
                    }
                    else
                    {
                        //find which color in the configured gradient we are at
                        int color = int((gradient_count - 1) * fragCoord.y);

                        //find where on y this and next color is supposed to be
                        float y_min = color / (gradient_count - 1.0);
                        float y_max = (color + 1.0) / (gradient_count - 1.0);

                        //make color
                        fragColor = vec4(normalize_C(fragCoord.y, gradient_colors[color], gradient_colors[color + 1], y_min, y_max), 1.0);
                    }
                }
            }
            else
            {
                fragColor = vec4(bg_color,1.0);
            }
        }
      '';
      ".config/cava/shaders/northern_lights.frag".text = ''
        #version 330

        in vec2 fragCoord;
        out vec4 fragColor;

        // bar values. defaults to left channels first (low to high), then right (high to low).
        uniform float bars[512];

        uniform int bars_count;    // number of bars (left + right) (configurable)

        uniform vec3 u_resolution; // window resolution, not used here

        //colors, configurable in cava config file
        uniform vec3 bg_color; // background color(r,g,b) (0.0 - 1.0), not used here
        uniform vec3 fg_color; // foreground color, not used here

        void main()
        {
            // find which bar to use based on where we are on the x axis
            int bar = int(bars_count * fragCoord.x);

            float bar_y = 1.0 - abs((fragCoord.y - 0.5)) * 2.0;
            float y = (bars[bar]) * bar_y;

            float bar_x = (fragCoord.x - float(bar) / float(bars_count)) * bars_count;
            float bar_r = 1.0 - abs((bar_x - 0.5)) * 2;

            bar_r = bar_r * bar_r * 2;

            // set color
            fragColor.r = fg_color.x * y * bar_r;
            fragColor.g = fg_color.y * y * bar_r;
            fragColor.b = fg_color.z * y * bar_r;
        }
      '';

      ".config/cava/shaders/pass_through.vert".text = ''
        #version 330


        // Input vertex data, different for all executions of this shader.
        layout(location = 0) in vec3 vertexPosition_modelspace;

        // Output data ; will be interpolated for each fragment.
        out vec2 fragCoord;

        void main()
        {
            gl_Position =  vec4(vertexPosition_modelspace,1);
            fragCoord  = (vertexPosition_modelspace.xy+vec2(1,1))/2.0;
        }
      '';

    };
  };
}
