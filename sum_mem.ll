define i32 @sum(int*, unsigned int)(ptr %arr, i32 %size) {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  store i32 0, ptr %res, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %size.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:
  %2 = load ptr, ptr %arr.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %5 = load i32, ptr %res, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, ptr %res, align 4
  br label %for.inc

for.inc:
  %6 = load i32, ptr %i, align 4
  %inc = add i32 %6, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond

for.end:
  %7 = load i32, ptr %res, align 4
  ret i32 %7
}