%% staging script for segmenting boston resting data
  
EEG.condition = 'NA';
EEG.group = 'NA';

fid = fopen('boston_participants.csv','r');
rline = fgetl(fid);
while ischar(rline);
    splitline = strsplit(rline,',');
    subj = splitline(1);
    if strcmp(EEG.subject,subj);
        risk = splitline(2);
	    risk = str2num(risk{1});
	    outcome = splitline(3);
	    outcome = str2num(outcome{1});
	    gender = splitline(4);
   	    EEG.condition = gender{:};
        if risk==1;
	        if outcome==0;
	            EEG.group = 'HRA-';
            elseif outcome==1;
	            EEG.group = 'HRA+';
	        else;
	            EEG.group = 'HRA_UKN';
	        end;
	    elseif risk==2;
            if outcome==0;
	            EEG.group = 'LRC-';
            elseif outcome==1;
                EEG.group = 'LRC+';
            else;
                EEG.group = 'LRC_UKN';
            end;
        else;
            if outcome==0;
	            EEG.group = 'lang-';
            elseif outcome==1;
                EEG.group = 'lang+';
            else;
                EEG.group = 'lang_UKN';
            end;
        end;
    end;
    rline = fgetl(fid);
end;
fclose(fid);
