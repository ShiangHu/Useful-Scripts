EEG = pop_marks_event_gap(EEG,{'_'},2000,'in_task',[.1 .4 .1], ...
			  'interval','off','critdir','max','exact','off', ...
			  'offsets',[2000 -2000],'ref_point','both','invert_flags','on');

gapflags=marks_label2index(EEG.marks.time_info,{'in_task'},'flags','exact','on');

EEG.marks=marks_add_label(EEG.marks,'time_info',{'out_task',[0 0 0],~gapflags});

%MARK FLAG GAPS THAT ARE < 2 SECONDS...
EEG=pop_marks_flag_gap(EEG,{'manual','out_task'},2000,'mark_gap',[.2,.2,.2],'offsets',[0 0],'ref_point','both');

%COMBINE MARKS STRUCTURE INTO MANUAL FLAGS....
EEG=pop_marks_merge_labels(EEG,'time_info',{'manual', ...
                                            'out_task', ...
                                            'mark_gap'}, ...
                                            'target_label','manual');


