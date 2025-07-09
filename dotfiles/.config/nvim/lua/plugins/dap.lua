local function setBreakpoints()
	local breakpoints = {
		"DapBreakpoint",
		"DapBreakpointCondition",
		"DapBreakpointRejected",
		"DapLogPoint",
	}

	for _, group in pairs(breakpoints) do
		vim.fn.sign_define(group, { text = "●", texthl = group })
	end
end

return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},

	keys = {
		-- Debugger
		{
			"<leader>d",
			group = "Debugger",
			nowait = true,
			remap = false,
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
			nowait = true,
			remap = false,
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
			nowait = true,
			remap = false,
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
			nowait = true,
			remap = false,
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
			nowait = true,
			remap = false,
		},
		{
			"<leader>du",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
			nowait = true,
			remap = false,
		},
		{
			"<leader>dq",
			function()
				require("dap").terminate()
				require("dapui").close()
				require("nvim-dap-virtual-text").toggle()
			end,
			desc = "Terminate",
			nowait = true,
			remap = false,
		},
		{
			"<leader>dl",
			function()
				require("dap").list_breakpoints()
			end,
			desc = "List Breakpoints",
			nowait = true,
			remap = false,
		},
		{
			"<leader>de",
			function()
				require("dap").set_exception_breakpoints({ "all" })
			end,
			desc = "Set Exception Breakpoints",
			nowait = true,
			remap = false,
		},
	},

	config = function()
		local dap = require("dap")
		local ui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		dap_virtual_text.setup()

		setBreakpoints()

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}

		dap.configurations.cpp = dap.configurations.c

		ui.setup()

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
