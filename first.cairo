// Iniciando el contrato Starknet.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

// Definiendo las varaibles de estado/storage variable.
@storage_var
func balance() -> (res: felt) {
}

// Función para incrementar el valor del balance.
@external
func increase_balance{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr,
}(amount: felt) {
    let (res) = balance.read();
    balance.write(res + amount);
    return ();
}

// Función para obtener el valor.
@view
func get_balance{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr,
}() -> (res: felt) {
    let (res) = balance.read();
    return (res=res);
}