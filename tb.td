def GPR;
def Imm;
def ops;

class Inst<int opcode, string asmstr, dag pattern> {
    //field bits<32> Inst = 0;
    int Opcode = opcode;
    string AsmString = asmstr;
    dag Operands = pattern;
}

def ADD_ri : Inst<7, "add $dst, $src1, $src2", (ops GPR:$dst, GPR:$src1, GPR:$src2)>;