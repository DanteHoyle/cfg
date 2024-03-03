# File: edit_config.fish

function edit_config --description="quickly navigate's nvim to a programs config directory"
    echo (type $argv[0])
end

edit_config $argv
