-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      {
        '<leader>Tf',
        function()
          vim.cmd [[exe v:count1 . "ToggleTerm direction=float"]]
        end,
        desc = 'ToggleTerm (float root_dir)',
      },
      {
        '<leader>Tz',
        function()
          vim.cmd [[exe v:count1 . "ToggleTerm direction=horizontal"]]
        end,
        desc = 'ToggleTerm (horizontal root_dir)',
      },
      {
        '<leader>Tv',
        function()
          vim.cmd [[exe v:count1 . "ToggleTerm direction=vertical"]]
        end,
        desc = 'ToggleTerm (vertical root_dir)',
      },
      {
        '<leader>Tn',
        '<cmd>ToggleTermSetName<cr>',
        desc = 'Set term name',
      },
      {
        '<leader>Ts',
        '<cmd>TermSelect<cr>',
        desc = 'Select term',
      },
    },
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      -- on_open = fun(t: Terminal), -- function to run when the terminal opens
      -- on_close = fun(t: Terminal), -- function to run when the terminal closes
      -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
      -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
      -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      -- direction = "vertical",
      close_on_exit = true, -- close the terminal window when the process exits
      -- shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        border = 'single',
      },
    },
  },
}
