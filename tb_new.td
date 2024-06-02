def GPR;
def Imm;
def ops;

class inst<int opcode, string asmstr, dag pattern> {
    int Opcode = opcode;
    string AsmString = asmstr;
    dag Operands = pattern;
}

multiclass ri_inst<int opc, string asmstr> {
     def _rr : inst<opc, !strconcat(asmstr, " $dst, $src1, $src2"), (ops GPR:$dst, GPR:$src1, GPR:$src2)>;
     def _ri : inst<opc, !strconcat(asmstr, " $dst, $src1, $src2"), (ops GPR:$dst, GPR:$src1, Imm:$src2)>;
}

defm ADD : ri_inst<7, "add">;
defm SUB : ri_inst<5, "sub">;
defm MUL : ri_inst<4, "mul">;