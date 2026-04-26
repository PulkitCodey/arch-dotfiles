# 1. Initialize the config (MUST be first)
config.load_autoconfig(False)

# 2. Define Gothic Palette
gothic_blood = '#600B1E'    # Deep Claret
gothic_void  = '#0D0107'    # Near-Black
gothic_mist  = '#a79494'    # Ash
gothic_wine  = '#2E232A'    # Smoked Plum

# 3. Global Settings
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"

# 4. Statusbar (Normal vs Insert Mode)
c.colors.statusbar.normal.bg = gothic_void
c.colors.statusbar.normal.fg = gothic_mist
c.colors.statusbar.insert.bg = gothic_blood
c.colors.statusbar.insert.fg = '#ffffff'

# 5. Completion Menu (The ":" Command Bar)
c.colors.completion.even.bg = gothic_wine
c.colors.completion.odd.bg  = gothic_void
c.colors.completion.fg      = gothic_mist

# 6. Keybinds
config.bind('tg', 'config-cycle colors.webpage.darkmode.enabled ;; reload')

# 1. Kill the hungry processes faster
c.qt.args = [
    'disable-gpu-compositing', 
    'disable-software-rasterizer',
    'disable-dev-shm-usage'
]

# 2. Limit the number of "renderer" processes
# This stops Chromium from spawning a new process for every single thing
c.qt.chromium.process_model = 'process-per-site'

# Force the engine to use low-end device optimizations (Uses less RAM)
c.qt.chromium.low_end_device_mode = 'always'
