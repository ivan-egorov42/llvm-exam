define i32 @sum(int*, unsigned int)(ptr %arr, i32 %size) {
entry:
  %cmp4.not = icmp eq i32 %size, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:
  %wide.trip.count = zext i32 %size to i64
  br label %for.body

for.cond.cleanup:
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %res.05 = phi i32 [ 0, %for.body.preheader ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %arr, i64 %indvars.iv
  %0 = load i32, ptr %arrayidx, align 4
  %add = add nsw i32 %0, %res.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body
}